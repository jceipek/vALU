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

// 32-input NOR gate
`define NOR32 nor #320

// More complex delays

// Longest path: 1 NOT, 1 2-input AND, 1 2-input OR
`define MUX2BY1 mux2by1 #50
// Longest path: 3 NOTs, 1 4-input AND, 1 5-input OR
`define MUX5BY1 mux5by1 #120
// Longest path: 3 NOTs, 1 4-input AND, 1 8-input OR
`define MUX8BY1 mux8by1 #150
