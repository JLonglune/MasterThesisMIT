#!/usr/bin/env python3
import json
from datetime import datetime
from drama.sara import get_basic_config

def isoify(obj):
    """Recursively convert datetimes in a structure to ISO strings."""
    if isinstance(obj, datetime):
        return obj.isoformat()
    elif isinstance(obj, dict):
        return {k: isoify(v) for k, v in obj.items()}
    elif isinstance(obj, (list, tuple)):
        return [isoify(v) for v in obj]
    else:
        return obj

def compact_print_dict(d, indent=4):
    spacer = ' ' * indent
    for key, val in d.items():
        if isinstance(val, dict):
            inner = []
            for k2, v2 in val.items():
                s2 = repr(v2)
                inner.append(f'{repr(k2)}: {s2}')
            inner_str = '{ ' + ', '.join(inner) + ' }'
            print(f"{spacer}{repr(key)}: {inner_str},")
        else:
            print(f"{spacer}{repr(key)}: {repr(val)},")
            
def main():
    # 1) All possible values / ranges [min, max]
    config_ranges = {
        # Discrete/enum or yes-no
        "inputMethod":                ["normal", "json", "xml"],
        "runMode":                    ["reentry", "risk", "reentry-risk", "combined"],
        "monteCarlo":                 [True, False],
        "reentryType":                ["controlled", "uncontrolled"],
        "uncontrolledMethod":         ["latitudeBandLimited", "longitudeBandLimited", "fullOrbit"],
        "growthScenario":             ["LOW-VARIANT", "MEDIUM-VARIANT", "HIGH-VARIANT"],
        "coordinateSystem":           ["cartesian", "keplerian", "geodetic"],
        "attitude":                   ["tumbling", "nadir-pointing", "inertial"],
        "fragmentsAttitudeAfterBreakup": ["inherited", "random", "fixed"],
        "dynamicEnvironment":         [True, False],
        "useWind":                    [True, False],
        "solarActivityFromFile":      [True, False],
        "useEnvironmentCSV":          [True, False],
        "plotVisibilityMaps":         [True, False],
        "plotObjectTrajectories":     [True, False],
        "propagationWithOscar":       [True, False],

        # Continuous as [min, max]
        "casualtyThreshold":          [5.0,   30.0],
        "inclinationAngle":           [0.0,   180.0],
        "globalSpacecraftTemperature":[200.0, 400.0],
        "element1":                   [6600.0,7000.0],  #Semi-major axis (a), in kilometers
        "element2":                   [0.0,   0.01],    #Eccentricity (e), unitless
        "element3":                   [0.0,   180.0],   #Inclination (i), in degrees
        "element4":                   [0.0,   360.0],   #Right ascension of the ascending node (Ω), in degrees
        "element5":                   [0.0,   360.0],   # Argument of perigee (ω), in degrees
        "element6":                   [0.0,   360.0],   #True anomaly (ν), in degrees
        "assumedCrossSection":        [5.0,   20.0],
        "dragCoefficient":            [1.0,   3.0],
        "reflectivityCoefficient":    [0.5,   2.0],
        "voxelatorResolutionLength":  [0.1,   1.0],
        "energyThreshold":            [10.0,  50.0],
        "densityScalingFactor":       [0.5,   2.0],


        # Solar activity split
        "solarActivity": {
            "ap":             [0.0,   30.0],
            "f107a":          [50.0,  200.0],
            "valuesFromFile":[True, False]
        }
    }

    print("### All possible parameter values/ranges:\n")
    print("{")
    compact_print_dict(config_ranges, indent=4)
    print("}")

    # 2) Fetch and print the default configuration
    default_cfg = get_basic_config()
    default_cfg = isoify(default_cfg)

    print("\n### Default SARA configuration:\n")
    print("{")
    compact_print_dict(default_cfg, indent=4)
    print("}")

if __name__ == '__main__':
    main()
