import os
import glob
import shutil
import json
import xml.etree.ElementTree as ET
from drama import sara
from drama.monte_carlo import Uniform, Gaussian


def prompt_overwrite(path: str) -> bool:
    """Ask the user whether to overwrite an existing directory."""
    while True:
        resp = input(f"The directory '{path}' already exists. Overwrite it? [y/n]: ").strip().lower()
        if resp in ('y', 'yes'):
            return True
        elif resp in ('n', 'no'):
            return False
        else:
            print("Unrecognized answer. Please enter 'y' (yes) or 'n' (no).")


def parse_value(s: str):
    """Convert XML text to bool, int, float or leave as str."""
    s = s.strip()
    if s.lower() in ('true', 'false'):
        return s.lower() == 'true'
    try:
        return int(s) if '.' not in s else float(s)
    except ValueError:
        return s


def load_configurations(xml_path: str):
    """Parse all_configurations.xml and return a list of parameter dicts."""
    tree = ET.parse(xml_path)
    root = tree.getroot()
    configs = []
    for cfg in root.findall('Configuration'):
        param_dict = {}
        for p in cfg.findall('Parameter'):
            name = p.get('name')
            val = parse_value(p.text or '')
            param_dict[name] = val
        configs.append(param_dict)
    return configs


if __name__ == '__main__':
    # Paths
    config_xml = 'my_simulations/full_sim/config_info/all_configurations.xml'
    dpz_dir = 'my_simulations/full_sim/sat_design/dpz_files'
    output_base = 'my_simulations/full_sim/output'

    # Load XML configs
    configs = load_configurations(config_xml)
    if not configs:
        print(f"No configurations found in {config_xml}")
        exit(1)

    # Find all .dpz files
    dpz_files = glob.glob(os.path.join(dpz_dir, '*.dpz'))
    if not dpz_files:
        print(f"No .dpz files found in {dpz_dir}")
        exit(1)

    os.makedirs(output_base, exist_ok=True)
    orig_cwd = os.getcwd()

    # Pour éviter de copier plusieurs fois le même objects.xml
    copied_objects = set()

    # Loop over each configuration and each satellite file
    for idx, cfg in enumerate(configs, start=1):
        cfg_filename = os.path.join(output_base, f'cfg{idx}.json')
        with open(cfg_filename, 'w') as f:
            json.dump(cfg, f, indent=2)
        print(f"Configuration written to '{cfg_filename}'")

        for dpz in dpz_files:
            sat_name = os.path.splitext(os.path.basename(dpz))[0]
            output_dir = os.path.join(output_base, f'cfg{idx}_{sat_name}')

            # Copier objects.xml une seule fois par satellite
            if sat_name not in copied_objects:
                src_objects_path = os.path.join('my_simulations/dpz_modif/output', sat_name, 'objects.xml')
                dst_objects_path = os.path.join(output_base, f'object_{sat_name}.xml')

                if os.path.exists(src_objects_path):
                    shutil.copy2(src_objects_path, dst_objects_path)
                    copied_objects.add(sat_name)
                    print(f"→ 'objects.xml' copié vers {dst_objects_path}")
                else:
                    print(f"⚠️ 'objects.xml' introuvable pour {sat_name} à {src_objects_path}")

            # Overwrite prompt
            if os.path.isdir(output_dir):
                if prompt_overwrite(output_dir):
                    shutil.rmtree(output_dir)
                    print(f"→ Deleted '{output_dir}', recreating it.")
                else:
                    print(f"→ Skipping satellite '{sat_name}' (config #{idx}).")
                    continue

            os.makedirs(output_dir, exist_ok=True)
            print(f"\n=== Config #{idx} – Satellite '{sat_name}' ===")

            # Load the model and list contents
            model = sara.get_model(project=dpz)
            model.ls()
            for el in model.el:
                print(el)

            # Change into output directory
            os.chdir(output_dir)

            # Print the XML configuration
            print(f"\n>>> XML Configuration #{idx} for satellite '{sat_name}':")
            for param, value in cfg.items():
                print(f"    {param}: {value}")

            config_run = sara.get_basic_config()

            # Run SARA with only the XML parameters
            print('--- Launching SARA with XML configuration ---')
            sara_output = sara.run(
                **config_run,
                model=model,
                save_output_dirs='.',
                keep_output_files='all',
                create_fig=False,
                json=f'sara_{sat_name}_cfg{idx}.json'
            )
            print('\nOUTPUT FILES\n', sara_output)

            # Return to original directory
            os.chdir(orig_cwd)
