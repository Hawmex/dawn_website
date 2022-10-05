class RgbColor {
  final int red;
  final int green;
  final int blue;
  final double alpha;

  const RgbColor(this.red, this.green, this.blue, [this.alpha = 1]);

  RgbColor withAlpha(final double alpha) => RgbColor(red, green, blue, alpha);

  @override
  String toString() => 'rgb($red $green $blue / $alpha)';
}
