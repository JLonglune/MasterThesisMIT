from PyQt5.QtWidgets import QWidget, QVBoxLayout
from pyvistaqt import QtInteractor
import pyvista as pv
from pyvista import examples
import numpy as np
from matplotlib.figure import Figure
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas 
 
class PlotWidgetEarth(QWidget):

    def __init__(self, parent=None):

        """
        Widget to plot the Earth using PyVista.
        """

        super().__init__(parent)
        self.setStyleSheet(f"background-color: {parent.config['colors']['bg_color']};")
 
        # PyVista 3D plotter
        self.plotter = QtInteractor(self)
        layout = QVBoxLayout()
        layout.addWidget(self.plotter.interactor)
        self.setLayout(layout)
 
        # Draw the Earth
        self.draw_earth()
 
    def draw_earth(self):

        self.plotter.clear()
 
        # Load Earth mesh and texture
        earth = examples.planets.load_earth(radius=6371.0,
                                            lat_resolution=18,
                                            lon_resolution=36)
        texture = examples.load_globe_texture()

        # Add Earth with texture
        self.plotter.add_mesh(earth, texture=texture)
 
        # Optional: Add starry background
        star_bg = examples.planets.download_stars_sky_background(load=False)
        self.plotter.add_background_image(star_bg)
 
        # Camera settings
        self.plotter.camera.zoom(1.5)
        self.plotter.reset_camera()
 

class PlotWidgetGraph(QWidget):

    def __init__(self, parent, altitude_list, mass_deposit_lists, mat_checked):
        """
        Widget to plot a function using Matplotlib.
        """
 
        ## LAUNCHING ##
        super().__init__(parent)
        self.setStyleSheet(f"background-color: {parent.config['colors']['bg_color']};")
 
        ## DEFAULT VALUES ##
        self.altitude_list = altitude_list
        self.altitudemin = np.min(altitude_list)
        self.altitudemax = np.max(altitude_list)
 
        ## FIGURE AND CANVAS ##
        # plt.rcParams.update({
        #     "text.usetex": True,
        #     "font.family": "sans-serif",
        #     "font.sans-serif": "Helvetica",
        # })
        self.figure = Figure()
        self.figure.patch.set_facecolor(parent.config['colors']['bg_color'])
        self.canvas = FigureCanvas(self.figure)
        layout = QVBoxLayout()
        layout.addWidget(self.canvas)
        self.setLayout(layout)
 
        ## FIRST DRAW ##
        self.draw_function(mass_deposit_lists, mat_checked)
 
    def draw_function(self, mass_deposit_lists, mat_checked):
        
        ## CLEAR THE FIGURE ##
        self.figure.clear()
        ax = self.figure.add_subplot(111)
 
        ## SET THE COLORS ##
        ax.set_facecolor(self.parent().config['colors']['bg_color'])
        ax.spines['left'].set_color(self.parent().config['colors']['axis_color'])
        ax.spines['bottom'].set_color(self.parent().config['colors']['axis_color'])
        ax.spines['right'].set_color(self.parent().config['colors']['axis_color'])
        ax.spines['top'].set_color(self.parent().config['colors']['axis_color'])
        ax.xaxis.set_tick_params(color=self.parent().config['colors']['axis_color'])
        ax.yaxis.set_tick_params(color=self.parent().config['colors']['axis_color'])
        ax.tick_params(axis='x', colors=self.parent().config['colors']['axis_color'])
        ax.tick_params(axis='y', colors=self.parent().config['colors']['axis_color'])
        ax.xaxis.label.set_color(self.parent().config['colors']['axis_color'])
        ax.yaxis.label.set_color(self.parent().config['colors']['axis_color'])
 
        
        ## PLOT THE FUNCTION ##
        max=0
        for i, bool in enumerate(mat_checked): 
            if bool : 
                ax.plot(mass_deposit_lists[i] * 1000, self.altitude_list, color=self.parent().mat_colors[i], lw=1.5)
                if np.max(mass_deposit_lists[i]) > max :
                    max = np.max(mass_deposit_lists[i])
        if max == 0 : 
            max = 1
        ax.set_xlabel("Deposit Mass [kg]")
        ax.set_ylabel("Altitude [km]")
        ax.set_ylim(self.altitudemin, self.altitudemax)
        ax.set_xlim(0, max*1000*1.1)

        ## DRAW THE CANVAS ##
        self.canvas.draw()