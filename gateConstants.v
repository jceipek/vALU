/* gateConstants.v
part of project vALU by FluffyTheGatekeeper
Julian Ceipek, Yuxin Guan, Philip Z Loh, Sasha Sproch
Computer Architecture, Olin College Fall 2012 */

// A one-input gate has a delay of 10
`define NOT not #10

// A two-input gate has a delay of 20
`define XOR xor #20
`define AND and #20
`define OR or #20

// More complex
`define MUX2BY1 mux2by1 #50
`define MUX5BY1 mux5by1 #150
