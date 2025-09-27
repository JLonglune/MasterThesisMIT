# External Libraries
import sys
import toml
from PyQt5.QtWidgets import QApplication
# Internal Libraries
from gui.main_window import MainWindow
 
def load_config(path="my_simulations/visualisation/config.toml"):
    return toml.load(path)
 
def main():
    # Load configuration from config.toml
    config = load_config()
    # Initialize the application and show it
    app = QApplication([])
    window = MainWindow(config)
    window.show()
    sys.exit(app.exec_())
 
if __name__ == "__main__":
    main()