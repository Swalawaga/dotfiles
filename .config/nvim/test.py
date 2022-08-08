#!/usr/bin/python3
import sys
from GPTJ.Basic_api import SimpleCompletion

if(sys.argv):
    with open(sys.argv[1]) as test:
        prompt = test.read()
        #print(sys.argv[1])
        #print(prompt)
        max_length = 200
        temperature = 0.05
        top_probability = 0.9
        query = SimpleCompletion(prompt, length=max_length, t=temperature, top=top_probability)
        query.simple_completion()

