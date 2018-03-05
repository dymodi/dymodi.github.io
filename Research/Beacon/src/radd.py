'''
Bayesian Estimation for RADD
For more please found in the blog "Real-time RADD"
Yi Ding, 02/27/18
'''

import numpy as np
import matplotlib.pyplot as plt

# Import P(r_i|S_i)
likelihood_rssi = []
for i in range(-109, -49, 1):
    likelihood_rssi.append(i)
likelihood_p_origin = [0.000843471, 0.000909981, 0.001529736, 0.001680896, 0.002530413, 0.002865988, 0.003742714, 0.004138753,
                0.005626164, 0.006841488, 0.00897284,  0.009637942, 0.013350424, 0.012972525, 0.015575495, 0.014843882,
                0.021473747, 0.019995405, 0.025131811, 0.01923356,  0.030473795, 0.027242001, 0.032626309, 0.031646794,
                0.035513459, 0.032184923, 0.044214211, 0.041414734, 0.037463419, 0.037124822, 0.038920599, 0.032762353,
                0.036991801, 0.032623286, 0.033221878, 0.028327327, 0.038899436, 0.027725712, 0.031531913, 0.024357874,
                0.028723366, 0.02119259,  0.022879532, 0.017347087, 0.014710862, 0.010197233, 0.006384986, 0.004102474,
                0.002497158, 0.002043679, 0.001200208, 0.000649987, 0.000492781, 0.00021767,  7.25567E-05, 5.13943E-05,
                4.53479E-05, 1.20928E-05, 6.04639E-06, 9.06958E-06]
likelihood_rssi.append(-200)

# A simple implementation
epsilon = 1e-9
prob_r_j_S_i_heard = epsilon
prob_r_j_S_i_not_heard = 0.9
eta = 1e-7

# Distribution should be different for indoor and outdoor case
likelihood_p_in_shop = []
likelihood_p_outdoor = []
for prob in likelihood_p_origin:
    likelihood_p_in_shop.append(prob)
    likelihood_p_outdoor.append(eta)
likelihood_p_in_shop.append(1e-10)
likelihood_p_outdoor.append(1e-1)

# Scaling of likelihood
for i in range(0, len(likelihood_p_outdoor)):
    likelihood_p_in_shop[i] = likelihood_p_in_shop[i]/sum(likelihood_p_in_shop)
    likelihood_p_outdoor[i] = likelihood_p_outdoor[i]/sum(likelihood_p_outdoor)

print('prob_r_j_S_i_not_heard: ', prob_r_j_S_i_not_heard)
print('prob_r_j_O: ', likelihood_p_outdoor[len(likelihood_p_outdoor)-1])
print('The above two should be more or less the same.')

# Update function
def bayesian(time_axis, shop_id_list, rssi_matrix):

    # Input check
    [n_timestamps, n_shops] = rssi_matrix.shape
    if n_timestamps != len(time_axis):
        raise Exception('# of timestamp not match')
    if n_shops != len(shop_id_list):
        raise Exception('# of shop not match')

    # Augment the shop list to add a choice: not any shop (outdoors)
    shop_id_list.append(-1)

    # prior_list maintains the possibilities at each shop
    # Initialize prior with equal possibilities
    prior_list = []
    for i in range(0, len(shop_id_list)):
        prior_list.append(1.0 / len(shop_id_list))

    print('RADD of one rider among ', len(shop_id_list) ,' shops accross ', len(time_axis))
    print("prior: ", prior_list)
    input('Press to start...')

    # Initialize the posterior matrix
    posterior_matrix = np.empty([len(time_axis), len(shop_id_list)])
    # Online update
    for i in range(0, len(time_axis)):
        print('timestamp: ', time_axis[i])
        has_new = False
        rssi_vector = rssi_matrix[i, :]
        print('rssi vector: ', rssi_vector)
        if max(rssi_vector) > -200:
            has_new = True

        # Update posterior of shops
        for j in range(0, len(shop_id_list)-1):
            # Find likelihood shop by shop
            likelihood = 1

            for k in range(0, len(shop_id_list)-1):
                rssi = rssi_matrix[i, k]  # The RSSI received
                if j == k:
                    # We are handling prob_r_i_S_i (same shop case)
                    likelihood = likelihood * likelihood_p_in_shop[likelihood_rssi.index(rssi)]
                else:
                    # We are handling prob_r_j_S_i (different shop case)
                    if rssi == -200:
                        likelihood = likelihood * prob_r_j_S_i_not_heard
                    else:
                        likelihood = likelihood * prob_r_j_S_i_heard
            # Compute posterior, here we ignore denominator since we will do scaling later
            posterior_matrix[i, j] = prior_list[j] * likelihood

        # Update posterior of outdoor case
        # Find likelihood
        likelihood = 1
        for k in range(0, len(shop_id_list)-1):
            rssi = rssi_matrix[i, k]  # The RSSI received
            likelihood = likelihood * likelihood_p_outdoor[likelihood_rssi.index(rssi)]
        # Compute posterior of outdoor case
        posterior_matrix[i,len(shop_id_list)-1] = prior_list[len(shop_id_list)-1] * likelihood

        # Posterior check (adding constraints)
        for j in range(0, len(shop_id_list)):
            if posterior_matrix[i, j] < 1e-5:
                posterior_matrix[i, j] = 1e-5

        # Scaling
        for j in range(0, len(shop_id_list)):
            posterior_matrix[i, j] = posterior_matrix[i, j] / np.sum(posterior_matrix[i, :])
            # Posterior so far becomes prior
            prior_list[j] = posterior_matrix[i, j]

        print("prior: ", prior_list)
        # # Break for check
        # if has_new is True:
        #     input('Press to continue...')

    # Print posterior
    print(posterior_matrix)

    # Plot rider's posterior with respect to multiple shops
    for i in range(0, len(shop_id_list)):
        #plt.plot(time_axis, rssi_matrix[:,i], label = 'shop'+str(i))
        plt.plot(time_axis, posterior_matrix[:, i], label='shop_id: '+str(shop_id_list[i]))
    plt.xlabel('unix_timestamp / second')
    plt.ylabel('posterior')
    plt.title('Rider\'s posterior (Real-time detection)')
    plt.legend()
    plt.show()


    # Arrival/Departure detection

    # Reture result
    return posterior_matrix