## Reinforcement Learing sample code
## From blog: https://towardsdatascience.com/reinforcement-learning-with-openai-d445c2c687d2
## Based on OpenAI

# 1. It renders instance for 500 timesteps, perform random actions
import gym
env = gym.make('CartPole-v0')
for i_episode in range(20):
    observation = env.reset()
    for t in range(100):
        env.render()
        print(observation)
        action = env.action_space.sample()
        observation, reward, done, info = env.step(action)
        if done:
            print("Episode finished after {} timesteps".format(t+1))
            break