# Digital_Fitlers_VHDL
These entities performs the behavior of an elliptic bandpass filter of sixth order in vhdl. Using fixed point units for filter coeffs and Structural architecture for the top level.
## Stimulus for IIR

> > force RST 0 0, 1 10ns

For example for a clock :

> > force CLK 1 0, 0 5 ns -repeat 10 ns

> > force STR 1 0, 0 10 ns -repeat 1 ms

In autofill, the used signals will be XIN and YOUT

YOUT with 0.001 fixed point 18 bits
