from drama import sara
from drama.monte_carlo import Gaussian
import pprint

if __name__ == '__main__':
    
    config = {'el1': Gaussian(mu=6700, sigma=2.5)}
    results = sara.run_monte_carlo_lazy(
        config,
        n=2,
        keep_output_files='all',
        save_output_dirs='my_simulations/MC_sim/output/sat_2583'
    )

    # Transforme l'iterator en liste concrète de dict résultat
    for run in results['results']:
        print(run['config']['output_dir']) 