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
public class Thornhill : GLib.Object {
    /**
     * @param D bore diametere in inches.
     * @param Area Area of the bore in inches squared.
     * @param Hr Hydrodynamic roughness factor. Between 1.25 and 1.4.
     * @param Vol Total volume of the gun in inches cubed.
     * @param C total charge in pounds.
     * @param GasTemp
     */
    public static double barrel_heat_loss (double D, double Area, double Hr, double Vol, double C, double GasTemp)
    {
        // maximum temperature in the barrel
        double T = (GasTemp - 300.0) / (1.7 + 0.38 * Math.pow(D, 0.5) * Math.pow(Math.pow(D, 2) / C, 0.86));

        return 0.397 * Math.pow(D, 3/2) * Vol / Area * T * Hr;
    }
}
} // namespace
