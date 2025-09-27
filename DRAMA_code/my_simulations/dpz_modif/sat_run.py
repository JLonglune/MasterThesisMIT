import os
import glob
import shutil
import zipfile
from drama import sara

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
    # Base directories
    dpz_dir = 'my_simulations/dpz_modif/dpz_files'
    output_base_dir = 'my_simulations/dpz_modif/output'
    os.makedirs(output_base_dir, exist_ok=True)
    
    # Gather all .dpz files
    dpz_files = glob.glob(os.path.join(dpz_dir, '*.dpz'))
    if not dpz_files:
        print(f"No .dpz files found in {dpz_dir}")
        exit(1)

    # Save the original working directory
    orig_cwd = os.getcwd()

    for dpz_file in dpz_files:
        # Derive a folder name from the DPZ filename
        basename = os.path.splitext(os.path.basename(dpz_file))[0]
        output_dir = os.path.join(output_base_dir, basename)

        if os.path.isdir(output_dir):
            # If it already exists, ask the user what to do
            if prompt_overwrite(output_dir):
                shutil.rmtree(output_dir)
                print(f"→ Deleted existing directory '{output_dir}' and will recreate it.")
                os.makedirs(output_dir)
            else:
                print(f"→ Skipping simulation for '{basename}'.")
                continue
        else:
            # Otherwise create it
            os.makedirs(output_dir)

        print(f"\n=== Processing {basename} ===")

        # Extract objects.xml from the dpz archive (robust version)
        extracted_path = os.path.join(output_dir, 'objects.xml')

        try:
            with zipfile.ZipFile(dpz_file, 'r') as zip_ref:
                # Rechercher tous les fichiers se terminant par 'objects.xml'
                xml_candidates = [f for f in zip_ref.namelist() if f.lower().endswith('objects.xml')]

                if not xml_candidates:
                    print(f"⚠ Aucun fichier 'objects.xml' trouvé dans {dpz_file}")
                    continue

                # Prendre le premier match
                xml_path = xml_candidates[0]
                temp_extract_path = zip_ref.extract(xml_path, output_dir)
                
                # Créer le chemin final et déplacer le fichier
                shutil.move(temp_extract_path, extracted_path)

                # Supprimer les dossiers intermédiaires si besoin
                parts = xml_path.split('/')
                if len(parts) > 1:
                    intermediate_dir = os.path.join(output_dir, parts[0])
                    if os.path.isdir(intermediate_dir):
                        shutil.rmtree(intermediate_dir)

                print(f"→ 'objects.xml' extrait avec succès vers {extracted_path}")

        except zipfile.BadZipFile:
            print(f"❌ Fichier ZIP corrompu : {dpz_file}")
            continue
        except Exception as e:
            print(f"❌ Erreur lors de l'extraction de 'objects.xml' : {e}")
            continue


        # Load the SARA model
        mymodel = sara.get_model(project=dpz_file)

        # List elements, connections, and inclusions
        mymodel.ls()

        # Print each element
        for el in mymodel.el:
            print(el)

        # Launch the simulation
        print('--- Launching SARA ---')
        os.chdir(output_dir)
        config = sara.get_basic_config()
        print('\n-- Basic Configuration --')
        print(config)

        # Run SARA
        sara_output = sara.run(
            **config,
            model=mymodel,
            save_output_dirs='.',
            keep_output_files='all',
            create_fig=False,
            json=f'sara_{basename}.json'
        )
        print('\nOUTPUT FILES\n', sara_output)

        # Return to the original directory before the next iteration
        os.chdir(orig_cwd)
