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
public class FreeRecoil : GLib.Object {
	/**
	 * Calculate the free recoil energy of a firearm being fired.
	 *
	 * @param EjectaWeight Weight in grains of the ejecta (bullet, wad, etc.).
	 * @param EjectaVelocity Velocity of the ejecta in feet per second.
	 * @param PropellentWeight Weight of propellent in grains.
	 * @param PropellentGasVelocity Velocity of propellent gases in feet per second.
	 * @param FirearmWeight Weigh of firearm in pounds.
	 *
	 * @return The free recoil energy in ft-lb.
	 */
	public static double CalcFreeRecoil(double EjectaWeight, double EjectaVelocity, double PropellentWeight, PropellentGasVelocity PGVelocity, double FirearmWeight)
	{
		double M = FirearmWeight / -(GRAVITY * 2);
		double V = ((EjectaWeight * EjectaVelocity) + (PropellentWeight * PGVelocity.to_double())) / Mass.PoundToGrain(FirearmWeight);

		debug("M: %f", M);
		debug("V: %f", V);

		return (M * V * V);
	}
}
} // namespace
