#!/usr/bin/env python3
import os
import glob
import shutil

from drama import sara
from drama.monte_carlo import Uniform, Gaussian

def prompt_overwrite(path: str) -> bool:
    """Ask whether to overwrite an existing directory."""
    while True:
        resp = input(f"The directory '{path}' already exists. Overwrite it? [y/n]: ").strip().lower()
        if resp in ('y', 'yes'):
            return True
        if resp in ('n', 'no'):
            return False
        print("Please enter 'y' or 'n'.")

if __name__ == '__main__':
    # Paths to your DPZ inputs and where to store MC outputs
    dpz_dir     = 'my_simulations/MC_sim/dpz_files'
    output_base = 'my_simulations/MC_sim/output'
    os.makedirs(output_base, exist_ok=True)

    # Find all .dpz files
    dpz_files = glob.glob(os.path.join(dpz_dir, '*.dpz'))
    if not dpz_files:
        print(f"No .dpz files found in {dpz_dir}")
        exit(1)

    # Save original working directory
    orig_cwd = os.getcwd()

    for dpz in dpz_files:
        # Turn the DPZ path into an absolute path
        dpz_abs = os.path.abspath(dpz)
        sat_name = os.path.splitext(os.path.basename(dpz_abs))[0]
        output_dir = os.path.join(output_base, sat_name)

        # Handle existing output dir
        if os.path.isdir(output_dir):
            if prompt_overwrite(output_dir):
                shutil.rmtree(output_dir)
                print(f"→ Deleted existing directory '{output_dir}'.")
            else:
                print(f"→ Skipping {sat_name}")
                continue

        # Create fresh output dir
        os.makedirs(output_dir, exist_ok=True)
        print(f"\n=== Processing {sat_name} ===")

        # 1) Load model & default config using the absolute DPZ path
        mymodel = sara.get_model(project=dpz_abs)
        base_cfg = sara.get_basic_config()

        # List elements, connections, and inclusions
        mymodel.ls()

        # 2) Build your Monte Carlo configuration
        #cfg = base_cfg.copy()

        # 3) Change into the satellite’s output directory
        os.chdir(output_dir)

        print('\n ici \n')
        cfg = {'el1': Gaussian(mu=6700, sigma=2.5)}
        
        print("\n-- Monte Carlo Configuration --")
        for k, v in cfg.items():
            print(f"   {k}: {v}")
        
        # 4) Run X MC samples, saving each run into ./run_0, ./run_1, …
        mc_results = sara.run_monte_carlo(
            config            = cfg,
            n                 = 2,
            project           = dpz_abs,      # absolute path to the .dpz ZIP
            model             = mymodel,
            #save_output_dirs  = '.',          # creates ./run_0, ./run_1, …
            keep_output_files = 'all',
            create_fig        = False,
            json              = f'montecarlo_{sat_name}.json'
        )

        results_txt = os.path.join(output_dir, f"mc_results_{sat_name}.txt")

        # S’assure que le dossier parent existe
        os.makedirs(os.path.dirname(results_txt), exist_ok=True)

        # Redirige le print dans le fichier
        with open(results_txt, 'w') as f:
            print("\nMC RESULTS:\n", mc_results, file=f)

        print(f"→ MC RESULTS saved to {results_txt}")


        #print("\nMC RESULTS:\n", mc_results)

        # 5) Return to the original working directory
        os.chdir(orig_cwd)
