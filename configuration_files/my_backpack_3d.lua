-- Copyright 2016 The Cartographer Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

include "map_builder.lua"
include "trajectory_builder.lua"

options = {
  map_builder = MAP_BUILDER,
  trajectory_builder = TRAJECTORY_BUILDER,
  map_frame = "map",
  tracking_frame = "base_link",
  published_frame = "base_link",
  odom_frame = "odom",
  provide_odom_frame = false,
  publish_frame_projected_to_2d = false,
  use_odometry = false,
  use_nav_sat = false,
  use_landmarks = false,
  num_laser_scans = 1,
  num_multi_echo_laser_scans = 0,
  num_subdivisions_per_laser_scan = 1,
  num_point_clouds = 1,
  lookup_transform_timeout_sec = 0.2,
  submap_publish_period_sec = 0.3,
  pose_publish_period_sec = 5e-3,
  trajectory_publish_period_sec = 30e-3,
  rangefinder_sampling_ratio = 1.,
  odometry_sampling_ratio = 1.,
  fixed_frame_pose_sampling_ratio = 1.,
  imu_sampling_ratio = 1.,
  landmarks_sampling_ratio = 1.,
}

TRAJECTORY_BUILDER_3D.num_accumulated_range_data = 8  --larger the number is, accurater the map get but slower, last adjust?

TRAJECTORY_BUILDER_3D.min_range = 0.3
TRAJECTORY_BUILDER_3D.max_range = 5

--MAP_BUILDER.use_trajectory_builder_2d = true  --robot gone mad but map shows up
MAP_BUILDER.use_trajectory_builder_3d = true --the trajectory is obviously wrong

--TRAJECTORY_BUILDER_3D.voxel_filter_size = 5e-2  --smaller the accurater


TRAJECTORY_BUILDER_3D.ceres_scan_matcher.translation_weight = 1e-9  --The bigger the weight of a source of data is, the more emphasis Cartographer will put on this source of data when doing scan matching
TRAJECTORY_BUILDER_3D.ceres_scan_matcher.rotation_weight = 1e-9
--TRAJECTORY_BUILDER_3D.imu_gravity_time_constant=1e-1

--TRAJECTORY_BUILDER_3D.ceres_scan_matcher.ceres_solver_options.use_nonmonotonic_steps = true  --?
--TRAJECTORY_BUILDER_3D.ceres_scan_matcher.ceres_solver_options.max_num_iterations = 100
--TRAJECTORY_BUILDER_3D.ceres_scan_matcher.ceres_solver_options.num_threads = 1  --didn't really help

TRAJECTORY_BUILDER_3D.use_online_correlative_scan_matching = true
TRAJECTORY_BUILDER_3D.real_time_correlative_scan_matcher.linear_search_window = 0.1
--TRAJECTORY_BUILDER_3D.real_time_correlative_scan_matcher.angular_search_window = 120
TRAJECTORY_BUILDER_3D.real_time_correlative_scan_matcher.translation_delta_cost_weight = 1e-9
TRAJECTORY_BUILDER_3D.real_time_correlative_scan_matcher.rotation_delta_cost_weight = 1e-9

TRAJECTORY_BUILDER_3D.submaps.num_range_data = 8  --used by global SLAM to fix the drift of local map


return options
