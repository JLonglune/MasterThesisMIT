import os
import glob
import shutil
from drama import sara
from drama.monte_carlo import Gaussian

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

if __name__ == '__main__':
    # Directories
    dpz_dir = 'my_simulations/test/dpz_files'
    output_base_dir = 'my_simulations/test/output'
    os.makedirs(output_base_dir, exist_ok=True)
    
    # Find all .dpz files
    dpz_files = glob.glob(os.path.join(dpz_dir, '*.dpz'))
    if not dpz_files:
        print(f"No .dpz files found in {dpz_dir}")
        exit(1)

    # Save the original working directory
    orig_cwd = os.getcwd()

    for dpz_file in dpz_files:
        # Use the base filename (without extension) to name the output folder
        basename = os.path.splitext(os.path.basename(dpz_file))[0]
        output_dir = os.path.join(output_base_dir, basename)

        # If output directory already exists, ask the user what to do
        if os.path.isdir(output_dir):
            if prompt_overwrite(output_dir):
                shutil.rmtree(output_dir)
                print(f"→ Deleted existing directory '{output_dir}' and will recreate it.")
            else:
                print(f"→ Simulation for '{basename}' cancelled by user.")
                continue

        # Create the (new) output directory
        os.makedirs(output_dir, exist_ok=True)
        
        print(f"\n=== Processing {basename} ===")
        
        # Load the SARA model
        mymodel = sara.get_model(project=dpz_file)
        
        # List elements, connections, and inclusions
        mymodel.ls()
        
        # Iterate over each element
        for el in mymodel.el:
            print(el)
        
        # Run SARA
        print('--- Launching SARA ---')
        os.chdir(output_dir)
        config = sara.get_basic_config()
        print('\n-- Basic Configuration --')
        print(config)
        
        
        # Execute the simulation
        sara_output = sara.run(
            **config,
            model=mymodel,
            save_output_dirs='.',
            keep_output_files='all',
            create_fig=False,
            json=f'sara_{basename}.json'
        )
        print('\nOUTPUT FILES\n', sara_output)
        
        # Return to the original working directory
        os.chdir(orig_cwd)

        
        config = {'el1': Gaussian(mu=6700, sigma=2.5)}
        results_lazy = sara.run_monte_carlo_lazy(config, n=3, keep_output_files='all')

        #print the status of each single run:
        for res in results_lazy['results']:
            for single_run_res in res:
                print(single_run_res['status'])