## Reinforcement Learing sample code
## From blog: https://towardsdatascience.com/reinforcement-learning-with-openai-d445c2c687d2
## Based on OpenAI

# 1. It renders instance for 500 timesteps, perform random actions
import gym
env = gym.make('CartPole-v0')
env.reset()
for _ in range(1000):
    env.render()
    env.step(env.action_space.sample()) # take a random action