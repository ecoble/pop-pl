#lang racket/base
(require "harness.rkt" pop-pl/constants)

(prescription-test
 "../examples/popa/popa.pop"
 (=> start
     (start (n 25 micrograms/hour) fentanyl)
     (set ondemandfentanyl (n 25 micrograms)))
 (=> (painscore 10)
     (increase ondemandfentanyl (n 10 micrograms)))
 (=> (advance 61 minutes)
     (checkpainscore))
 (=> (painscore 2))
 (=> (painscore 2))
 (=> (painscore 2))
 (=> (advance 2 hours))
 (=> (painscore 2)
     (decrease ondemandfentanyl (n -10 micrograms))))