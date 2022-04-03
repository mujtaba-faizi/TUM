from SMP.motion_planner.node import PriorityNode

from SMP.motion_planner.plot_config import DefaultPlotConfig
from SMP.motion_planner.search_algorithms.best_first_search import GreedyBestFirstSearch

import numpy as np


class StudentMotionPlanner(GreedyBestFirstSearch):
    """
    Motion planner implementation by students.
    Note that you may inherit from any given motion planner as you wish, or come up with your own planner.
    Here as an example, the planner is inherited from the GreedyBestFirstSearch planner.
    """

    def __init__(self, scenario, planningProblem, automata, plot_config=DefaultPlotConfig):
        super().__init__(scenario=scenario, planningProblem=planningProblem, automaton=automata,
                         plot_config=plot_config)

    def evaluation_function(self, node_current: PriorityNode) -> float:
        ########################################################################
        # todo: Implement your own evaluation function here.                   #
        ########################################################################
        node_current.priority = self.heuristic_function(node_current=node_current)
        return node_current.priority

    def heuristic_function(self, node_current: PriorityNode) -> float:
        ########################################################################
        # todo: Implement your own heuristic cost calculation here.            #
        # Hint:                                                                #
        #   Use the State of the current node and the information from the     #
        #   planning problem, as well as from the scenario.                    #
        #   Some helper functions for your convenience can be found in         #
        #   ./search_algorithms/base_class.py                             #
        ########################################################################

        if self.reached_goal(node_current.list_paths[-1]):
            # node_current.list_paths = self.remove_states_behind_goal(node_current.list_paths)
            return 0.0

        # current_position = node_current.list_paths[-1][-1].position

        # obs_dist = self.calc_dist_to_closest_obstacle(currentLanelet[0][0], current_position, current_time_step)\

        if self.position_desired is None:
            # print("survival-mode")
            return self.time_desired.start - node_current.list_paths[-1][-1].time_step

        else:
            velocity = node_current.list_paths[-1][-1].velocity
            orientation = node_current.list_paths[-1][-1].orientation

            try:
                velocity_cost = abs(velocity - self.velocity_desired)
            except:
                velocity_cost = 0.0

            try:
                orientation_cost = abs(orientation - self.orientation_desired)
            except:
                orientation_cost = 0.0

            #print(self.orientation_desired.start, self.orientation_desired.end)
            # velocity_cost = abs(velocity - (self.velocity_desired[0]+abs(self.velocity_desired[0]-self.velocity_desired[-1])))

            if np.isclose(velocity, 0):
                return np.inf
            else:
                return self.calc_euclidean_distance(current_node=node_current) + velocity_cost + orientation_cost
                # + (abs(velocity - self.velocity_desired) * 0.5)
                # return ((self.calc_euclidean_distance(current_node=node_current) / velocity) * 1) #- (obs_dist * 0.5)
