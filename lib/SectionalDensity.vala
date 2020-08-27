/* Copyright 2020 Steven Oliver <oliver.steven@gmail.com>
 *
 * This file is part of libbalística.
 *
 * libbalística is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * libbalística is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with libbalística.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace LibBalistica {
public class SectionalDensity : GLib.Object {
	/**
	 * Calculate the sectional density of bullet.
	 *
	 * @param Weight Weight in grains of the bullet. Ex. 250
	 * @param Diameter Diameter of the bullet in inches. Ex. .338
	 *
	 * @return The sectional density of a bullet.
	 */
	public static double CalcSectionalDensity(double Weight, double Diameter)
	{
                return (Mass.GrainToPound(Weight) / Math.pow(Diameter, 2));
	}
}
} // namespace
