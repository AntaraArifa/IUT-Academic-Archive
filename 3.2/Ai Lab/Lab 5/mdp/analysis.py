# analysis.py
# -----------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
# 
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


######################
# ANALYSIS QUESTIONS #
######################

# Set the given parameters to obtain the specified policies through
# value iteration.

def question2():
    answerDiscount = 0.9
    answerNoise = 0
    return answerDiscount, answerNoise

def question3a():
    """
    Prefer the close exit (+1), risking the cliff (-10).
    - Short path is fine, even if close to cliff.
    """
    answerDiscount = 0.2
    answerNoise = 0.0
    answerLivingReward = -1.0
    return answerDiscount, answerNoise, answerLivingReward


def question3b():
    """
    Prefer the close exit (+1), avoiding the cliff.
    - Still prefers +1 over +10 but avoids risky cliff path.
    """
    answerDiscount = 0.3
    answerNoise = 0.3
    answerLivingReward = -0.1
    return answerDiscount, answerNoise, answerLivingReward


def question3c():
    """
    Prefer the distant exit (+10), risking the cliff.
    - Long-term reward is valued, so +10 is preferred.
    - Risky path OK due to 0 noise.
    """
    answerDiscount = 0.9
    answerNoise = 0.0
    answerLivingReward = -0.2
    return answerDiscount, answerNoise, answerLivingReward


def question3d():
    """
    Prefer the distant exit (+10), avoiding the cliff.
    - High discount and noise forces agent to take safe long route.
    """
    answerDiscount = 0.9
    answerNoise = 0.3
    answerLivingReward = -0.2
    return answerDiscount, answerNoise, answerLivingReward


def question3e():
    """
    Avoid both exits and the cliff (never terminate).
    - Living forever is better than ending.
    """
    answerDiscount = 1.0
    answerNoise = 0.0
    answerLivingReward = 1.0
    return answerDiscount, answerNoise, answerLivingReward


def question8():
    """
    Suggested Q-learning params.
    """
    answerEpsilon = 0.1
    answerLearningRate = 0.5
    return answerEpsilon, answerLearningRate


if __name__ == '__main__':
    print('Answers to analysis questions:')
    import analysis
    for q in [q for q in dir(analysis) if q.startswith('question')]:
        response = getattr(analysis, q)()
        print('  Question %s:\t%s' % (q, str(response)))
