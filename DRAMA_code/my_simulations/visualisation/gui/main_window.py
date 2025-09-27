# External Libraries
from PyQt5.QtWidgets import QWidget, QVBoxLayout, QLabel, QSlider, QHBoxLayout, QPushButton, QFrame, QCheckBox
from PyQt5.QtCore import Qt, QTimer
import pyvista as pv
import numpy as np
# Internal Libraries
from gui.plots import PlotWidgetEarth, PlotWidgetGraph
 
def create_latitude_line(lat_deg, radius=6371.0, n_points=100):
    lat = np.radians(lat_deg)
    lons = np.linspace(-180, 180, n_points)
    lons_rad = np.radians(lons)
    x = radius * np.cos(lat) * np.cos(lons_rad)
    y = radius * np.cos(lat) * np.sin(lons_rad)
    z = radius * np.sin(lat) * np.ones_like(lons_rad)
    return pv.lines_from_points(np.c_[x, y, z])

def create_longitude_line(lon_deg, radius=6371.0, n_points=100):
    lon = np.radians(lon_deg)
    lats = np.linspace(-90, 90, n_points)
    lats_rad = np.radians(lats)
    x = radius * np.cos(lats_rad) * np.cos(lon)
    y = radius * np.cos(lats_rad) * np.sin(lon)
    z = radius * np.sin(lats_rad)
    return pv.lines_from_points(np.c_[x, y, z])

class MainWindow(QWidget):
    def __init__(self, config):
        """
        Main window of the application.
        """
 
        ## LAUNCHING ##
        super().__init__()
        # Load the configuration
        self.config = config
        # Window title
        self.setWindowTitle(self.config['window']['win_title'])
        # Window default size
        width = self.config['window'].get('win_width')
        height = self.config['window'].get('win_height')
        self.resize(width, height)
        # Window layout
        self.layout = QHBoxLayout()
        self.setLayout(self.layout)
        # Window background color
        self.setStyleSheet(f"background-color: {self.config['colors']['bg_color']};")
 
        ## DEFAULT VALUES ##
        self.default_N = self.config['integration'].get('default_N')
        self.default_minN = self.config['integration'].get('default_minN')
        self.default_maxN = self.config['integration'].get('default_maxN')
        self.x0 = self.config['integration'].get('default_x0')
        self.x1 = self.config['integration'].get('default_x1')
        self.f_name = self.config['integration'].get('default_f')
        self.timer_running = False  # Timer stopped by default
        self.sat_list = [67, 525, 1292, 2583]
        self.mat_list = ['drama-AA7075', 'drama-HC-AA7075', 'drama-Bat-NiCd', 'drama-El-Mat', 'drama-SolarPanel-Mat', 'drama-A316', 'drama-CFRP', 'drama-Copper', 'drama-TiAl6v4']
        self.sat_number = np.zeros_like(self.sat_list)
        self.default_mat = "drama-AA7075"
        self.mat_colors = ['tab:blue', 'tab:orange', 'tab:green', 'tab:red', 'tab:purple', 'tab:brown', 'tab:pink', 'tab:gray', 'tab:olive']
        self.mat_colors_2 = ['#1f77b4', '#ff7f0e', '#2ca02c',  '#d62728', '#9467bd', '#8c564b',  '#e377c2', '#7f7f7f', '#bcbd22']

        ## PLOT 1 ##
        self.plot = PlotWidgetEarth(parent=self)
        self.layout.addWidget(self.plot)
        # Ajout des lignes latitude
        for lat in range(-75, 91, 15):
            line = create_latitude_line(lat)
            self.plot.plotter.add_mesh(line, color='white', opacity=0.3, line_width=1)

        # Ajout des lignes longitude
        for lon in range(-180, 181, 15):
            line = create_longitude_line(lon)
            self.plot.plotter.add_mesh(line, color='white', opacity=0.3, line_width=1)



        ## PLOT 2 ##
        self.altitude_list= np.linspace(0,120,2000)
        self.mass_deposit_lists = np.array([np.zeros_like(self.altitude_list) for i in range(len(self.mat_list))])

        self.plot = PlotWidgetGraph(parent=self, altitude_list=self.altitude_list, mass_deposit_lists=self.mass_deposit_lists, mat_checked=np.where(np.array(self.mat_list)==self.default_mat))
        self.layout.addWidget(self.plot)

        self.timer = QTimer(self)
        self.timer.timeout.connect(self.update_plot)

        ## PLOT 3 : Right Control Panel ## 
        self.control_panel = QVBoxLayout()

        title_label = QLabel("Timer control")
        title_label.setStyleSheet("font-weight: bold; font-size: 14px; margin-top: 10px;")
        self.control_panel.addWidget(title_label)  
        
        # Start/Stop Button
        self.timer_button = QPushButton("Start Timer")
        self.timer_button.clicked.connect(self.toggle_timer)
        self.control_panel.addWidget(self.timer_button)
        
        # Add spacer for future widgets
        self.control_panel.addStretch()
        
        # Wrap control panel in a QWidget
        self.control_panel_widget = QFrame()
        self.control_panel_widget.setLayout(self.control_panel)
        self.layout.addWidget(self.control_panel_widget)

        # Info section 
        title_label = QLabel("Info")
        title_label.setStyleSheet("font-weight: bold; font-size: 14px; margin-top: 10px;")
        self.control_panel.addWidget(title_label)
        self.total_sat_count = 0
        self.total_label = QLabel(f"Total satellites: {self.total_sat_count}")
        self.control_panel.addWidget(self.total_label)
        self.sat_number_labels = []
        for sat in self.sat_list:
            label = QLabel(f"Number of satellites {sat} : 0")
            self.control_panel.addWidget(label)
            self.sat_number_labels.append(label)

        # Material section 
        title_label = QLabel("Materials")
        title_label.setStyleSheet("font-weight: bold; font-size: 14px; margin-top: 10px;")
        self.control_panel.addWidget(title_label)

        # Check buttons
        self.mat_check_list=[]
        for i,mat in enumerate(self.mat_list):
            my_checkbox = QCheckBox(mat)
            my_checkbox.setStyleSheet(f"color: {self.mat_colors_2[i]};")
            if mat == self.default_mat:
                my_checkbox.setChecked(True)
            else : 
                my_checkbox.setChecked(False)
            my_checkbox.stateChanged.connect(self.check_mat)
            self.control_panel.addWidget(my_checkbox)
            self.mat_check_list.append(my_checkbox)

    
    def update_plot(self):
        
        ## SELECT SAT AND MATERIAL ##
        i = np.random.randint(0,4)
        sat = self.sat_list[i]
        self.sat_number[i]+=1
        self.sat_number_labels[i].setText(f"Number of satelites {sat} : {self.sat_number[i]}")
        self.total_sat_count += 1
        self.total_label.setText(f"Total satellites: {self.total_sat_count}")
        #j = np.random.randint(0,8)

        ## READ DATA ##
        for i, mat in enumerate(self.mat_list):
            with open('my_simulations/visualisation/data/'+ mat + '.txt') as file:
                line = file.readline().strip("\n").split("\t")
                alt_list = []
                mass_list = []
                while line != ['']:
                    #print(line)
                    if line[0][0] != "#" and line[0] == str(sat):
                        #print(line)
                        alt_list.append(float(line[1]))
                        mass_list.append(float(line[2]))
                    line = file.readline().strip("\n").split("\t")
                self.mass_deposit_lists[i] += np.interp(self.altitude_list, alt_list, mass_list)

        mat_checked = (self.mat_check_list[i].isChecked() for i in range(len(self.mat_check_list)))
        self.plot.draw_function(self.mass_deposit_lists, mat_checked)

    def toggle_timer(self):
        if self.timer_running:
            self.timer.stop()
            self.timer_button.setText("Start Timer")
        else:
            self.timer.start(1000)
            self.timer_button.setText("Stop Timer")
        self.timer_running = not self.timer_running

    def check_mat(self):
        print(self.sender().text())
