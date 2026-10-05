/// Converts a radius to a sigma value for use in Gaussian blur calculations.
double convertRadiusToSigma(double radius) {
  return radius * 0.57735 + 0.5;
}
