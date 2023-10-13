% finalprice.m
% game theory

boffer = 165;
soffer = 185;
neglig = .100;

while soffer-boffer>neglig,
   soffer = boffer+(soffer-boffer)/2;
   boffer = boffer+(soffer-boffer)/2;
end
boffer