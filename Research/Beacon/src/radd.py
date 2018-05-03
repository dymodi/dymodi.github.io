'''
Bayesian Estimation for RADD
For more please found in the blog "Real-time RADD"
Yi Ding, 02/27/18
'''

import numpy as np
import matplotlib.pyplot as plt
from scipy import signal


# Binary result to single label result
# [0, 0, 1, ...] list to four types: 0, 1, 2, 3
# The mapping can be found here:
# https://github.com/dymodi/dymodi.github.io/blob/master/Research/Beacon/data/DATA-FORMAT.md
# Note here x is radd result but not label list
def binary_radd_to_single(m, T, x):
    if m*T != len(x):
        raise Exception('radd result format not matching')
    num_flip = 0
    for i in range(1,len(x)):
        item = x[i]
        if item != 1 and item != 0:
            raise Exception('input list should only have 0 or 1')
        if item != x[i-1]:
            num_flip = num_flip + 1
    # Check
    if 1 in x:
        # Has action
        if x[0] == 0 and num_flip == 1:
            # Only arrival
            return 2
        elif x[0] == 1 and num_flip == 1:
            # Only departure
            return 1
        else:
            return 3
    else:
        # No action
        return 0


# # --------------------------------------------------------------------------------------------------------------------
# Low Pass Filter Way of RADD
# First Here we design a low-pass filter
fs = 1
nyq = 0.5 * fs
# wn = 0.05 / nyq
wn = 0.05
order = 8
b, a = signal.butter(order, wn, 'low', analog = False)

# # Plot Butterworth filter frequency response
# w, h = signal.freqz(b, a)
# plt.semilogx(w, 20 * np.log10(abs(h)))
# plt.title('Butterworth filter frequency response')
# plt.xlabel('Frequency [radians / second]')
# plt.ylabel('Amplitude [dB]')
# plt.margins(0, 0.1)
# plt.grid(which='both', axis='both')
# plt.axvline(wn, color='green') # cutoff frequency
# plt.show()

# Binary signal x is filtered
# Zeros lasts less than n times are considered as noise
# Noise are removed
def window_filter(y, n):
    x = [i for i in y]
    headPos = 0
    tailPos = 0
    lastNbr = 0
    for currPos in range(0, len(x)):
        # Force set ones
        if lastNbr == 0 and x[currPos] == 1:
            headPos = currPos
            if currPos - tailPos < n and headPos <= tailPos:
                for i in range(tailPos, currPos):
                    x[i] = 1
        # Force set zeros
        if lastNbr == 1 and x[currPos] == 0:
            tailPos = currPos
            if currPos - headPos < n and headPos <= tailPos:
                for i in range(headPos, currPos):
                    x[i] = 0
        lastNbr = x[currPos]
    return x

# Binary detection
def binary_detect(rssi_matrix, T, m, rssi_thresh):

    return


# Window filter
def lpf(rssi_matrix, T, m, rssi_thresh):
    time_axis = [i for i in range(0, T)]
    thresh_list = [rssi_thresh for i in range(0, T)]
    radd_result_list = []
    if m == 1:
        for rssi_list in rssi_matrix:
            # Filter with low pass filter
            rssi_filtered = signal.filtfilt(b, a, rssi_list)
            # Filter with window filter
            radd_list = []
            for rssi in rssi_filtered:
                if rssi < rssi_thresh:
                    radd_list.append(0)
                else:
                    radd_list.append(1)
            # Fitler to remove noise
            # radd_windowed = window_filter(radd_list, 10)
            # Get single result
            radd_result = binary_radd_to_single(m, T, radd_list)

            # # Plot Results
            # plt.subplot(2, 1, 1)
            # plt.plot(time_axis, rssi_list, 'C0', label='raw rssi')
            # plt.plot(time_axis, rssi_filtered, 'C1', label='filtered rssi')
            # plt.plot(time_axis, thresh_list, 'C3--', label='rssi threshold')
            # plt.ylabel('RSSI / dB (absent set as -110dB)')
            # plt.title('RSSI and RADD result in ' + str(T) + 's (result: '+str(radd_result)+')')
            # plt.legend()
            # plt.subplot(2, 1, 2)
            # plt.plot(time_axis, radd_list, 'C2', label='radd result')
            # # plt.plot(time_axis, radd_windowed, 'C2', label='radd result')
            # plt.ylabel('Radd result')
            # plt.xlabel('unix_timestamp / second')
            # # Set axis range
            # axes = plt.gca()
            # axes.set_ylim([-0.1,1.1])
            # plt.legend()
            # plt.show()

            radd_result_list.append(radd_result)

    return radd_result_list



# # --------------------------------------------------------------------------------------------------------------------
# # Bayesian Way of RADD
# # Import P(r_i|S_i)
# likelihood_rssi = []
# for i in range(-109, -49, 1):
#     likelihood_rssi.append(i)
# likelihood_p_origin = [0.000843471, 0.000909981, 0.001529736, 0.001680896, 0.002530413, 0.002865988, 0.003742714, 0.004138753,
#                 0.005626164, 0.006841488, 0.00897284,  0.009637942, 0.013350424, 0.012972525, 0.015575495, 0.014843882,
#                 0.021473747, 0.019995405, 0.025131811, 0.01923356,  0.030473795, 0.027242001, 0.032626309, 0.031646794,
#                 0.035513459, 0.032184923, 0.044214211, 0.041414734, 0.037463419, 0.037124822, 0.038920599, 0.032762353,
#                 0.036991801, 0.032623286, 0.033221878, 0.028327327, 0.038899436, 0.027725712, 0.031531913, 0.024357874,
#                 0.028723366, 0.02119259,  0.022879532, 0.017347087, 0.014710862, 0.010197233, 0.006384986, 0.004102474,
#                 0.002497158, 0.002043679, 0.001200208, 0.000649987, 0.000492781, 0.00021767,  7.25567E-05, 5.13943E-05,
#                 4.53479E-05, 1.20928E-05, 6.04639E-06, 9.06958E-06]
# likelihood_rssi.append(-110)
#
# # A simple implementation
# prob_r_j_S_i_heard = 1e-9
# prob_r_j_S_i_not_heard = 0.9
# eta = 1e-7
#
# # Distribution should be different for indoor and outdoor case
# likelihood_p_same_shop = []
# likelihood_p_diff_shop = []
# likelihood_p_outdoor = []
# for prob in likelihood_p_origin:
#     likelihood_p_same_shop.append(prob)
#     likelihood_p_diff_shop
#     likelihood_p_outdoor.append(eta)
# likelihood_p_in_shop.append(1e-10)
# likelihood_p_outdoor.append(1e-1)
#
# # Scaling of likelihood
# for i in range(0, len(likelihood_p_outdoor)):
#     likelihood_p_in_shop[i] = likelihood_p_in_shop[i]/sum(likelihood_p_in_shop)
#     likelihood_p_outdoor[i] = likelihood_p_outdoor[i]/sum(likelihood_p_outdoor)
#
# print('prob_r_j_S_i_not_heard: ', prob_r_j_S_i_not_heard)
# print('prob_r_j_O: ', likelihood_p_outdoor[len(likelihood_p_outdoor)-1])
# print('The above two should be more or less the same.')
#
# # Update function
# def bayesian(time_axis, shop_id_list, rssi_matrix):
#
#     # Input check
#     [n_timestamps, n_shops] = rssi_matrix.shape
#     if n_timestamps != len(time_axis):
#         raise Exception('# of timestamp not match')
#     if n_shops != len(shop_id_list):
#         raise Exception('# of shop not match')
#
#     # Augment the shop list to add a choice: not any shop (outdoors)
#     shop_id_list.append(-1)
#
#     # prior_list maintains the possibilities at each shop
#     # Initialize prior with equal possibilities
#     prior_list = []
#     for i in range(0, len(shop_id_list)):
#         prior_list.append(1.0 / len(shop_id_list))
#
#     print('RADD of one rider among ', len(shop_id_list) ,' shops accross ', len(time_axis))
#     print("prior: ", prior_list)
#     input('Press to start...')
#
#     # Initialize the posterior matrix
#     posterior_matrix = np.empty([len(time_axis), len(shop_id_list)])
#     # Online update
#     for i in range(0, len(time_axis)):
#         print('timestamp: ', time_axis[i])
#         has_new = False
#         rssi_vector = rssi_matrix[i, :]
#         print('rssi vector: ', rssi_vector)
#         if max(rssi_vector) > -110:
#             has_new = True
#
#         # Update posterior of shops
#         for j in range(0, len(shop_id_list)-1):
#             # Find likelihood shop by shop
#             likelihood = 1
#
#             for k in range(0, len(shop_id_list)-1):
#                 rssi = rssi_matrix[i, k]  # The RSSI received
#                 if j == k:
#                     # We are handling prob_r_i_S_i (same shop case)
#                     likelihood = likelihood * likelihood_p_in_shop[likelihood_rssi.index(rssi)]
#                 else:
#                     # We are handling prob_r_j_S_i (different shop case)
#                     if rssi == -110:
#                         likelihood = likelihood * prob_r_j_S_i_not_heard
#                     else:
#                         likelihood = likelihood * prob_r_j_S_i_heard
#             # Compute posterior, here we ignore denominator since we will do scaling later
#             posterior_matrix[i, j] = prior_list[j] * likelihood
#
#         # Update posterior of outdoor case
#         # Find likelihood
#         likelihood = 1
#         for k in range(0, len(shop_id_list)-1):
#             rssi = rssi_matrix[i, k]  # The RSSI received
#             likelihood = likelihood * likelihood_p_outdoor[likelihood_rssi.index(rssi)]
#         # Compute posterior of outdoor case
#         posterior_matrix[i,len(shop_id_list)-1] = prior_list[len(shop_id_list)-1] * likelihood
#
#         # Posterior check (adding constraints)
#         for j in range(0, len(shop_id_list)):
#             if posterior_matrix[i, j] < 1e-5:
#                 posterior_matrix[i, j] = 1e-5
#
#         # Scaling and update prior
#         sum_prob = np.sum(posterior_matrix[i, :])
#         for j in range(0, len(shop_id_list)):
#             posterior_matrix[i, j] = posterior_matrix[i, j]/sum_prob
#             # Posterior so far becomes prior
#             prior_list[j] = posterior_matrix[i, j]
#
#         print("prior: ", prior_list)
#         # Break for check
#         if has_new is True:
#             input('Press to continue...')
#
#     # Print posterior
#     print(posterior_matrix)
#
#     # Plot rider's posterior with respect to multiple shops
#     for i in range(0, len(shop_id_list)):
#         #plt.plot(time_axis, rssi_matrix[:,i], label = 'shop'+str(i))
#         plt.plot(time_axis, posterior_matrix[:, i], label='shop_id: '+str(shop_id_list[i]))
#     plt.xlabel('unix_timestamp / second')
#     plt.ylabel('posterior')
#     plt.title('Rider\'s posterior (Real-time detection)')
#     plt.legend()
#     plt.show()
#
#     # Arrival/Departure detection
#
#     # Reture result
#     return posterior_matrix