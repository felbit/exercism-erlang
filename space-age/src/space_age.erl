-module(space_age).

-export([age/2]).


per_earth_year(Seconds, Scale) -> age(earth, Seconds) / Scale.

age(earth, Seconds)    -> Seconds / 31557600;
age(mercury, Seconds)  -> per_earth_year(Seconds, 0.2408467);
age(venus, Seconds)    -> per_earth_year(Seconds, 0.61519726);
age(mars, Seconds)     -> per_earth_year(Seconds, 1.8808158);
age(jupiter, Seconds)  -> per_earth_year(Seconds, 11.862615);
age(saturn, Seconds)   -> per_earth_year(Seconds, 29.447498);
age(uranus, Seconds)   -> per_earth_year(Seconds, 84.016846);
age(neptune, Seconds)  -> per_earth_year(Seconds, 164.79132).