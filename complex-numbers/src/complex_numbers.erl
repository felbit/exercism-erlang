-module(complex_numbers).

-export([abs/1, add/2, conjugate/1, divide/2, equal/2, exp/1, imaginary/1, mul/2, new/2, real/1, sub/2]).


abs({R, I}) -> math:sqrt(R*R + I*I).

add({R1, I1}, {R2, I2}) -> {R1+R2, I1+I2}.

conjugate({R, I}) -> {R, 0-I}.

divide({R1, I1}, {R2, I2}) -> {(R1*R2 + I1*I2) / (R2*R2 + I2*I2), (I1*R2 - R1*I2) / (R2*R2 + I2*I2)}.

equal({R1, I1}, {R2, I2}) -> erlang:abs(R1-R2) < 0.5 andalso erlang:abs(I1-I2) < 0.5.

exp({R, I}) -> mul(new(math:exp(R), 0), new(math:cos(I), math:sin(I))).

imaginary({_, I}) -> I.

mul({R1, I1}, {R2, I2}) -> {R1*R2 - I1*I2, I1*R2 + R1*I2}.

new(R, I) -> {R, I}.

real({R, _}) -> R.

sub({R1, I1}, {R2, I2}) -> {R1-R2, I1-I2}.
