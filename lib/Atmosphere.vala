/* Copyright 2012-2020 Steven Oliver <oliver.steven@gmail.com>
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

// This was originally part of the GNU Exterior Balisitics Computer.

namespace LibBalistica {
public class Atmosphere : GLib.Object {
	/**
	 * Refraction
	 *
	 * @param Temperature
	 * @param Pressure
	 * @param RelativeHumidity
	 *
	 * @return Standardized refraction
	 */
	private static double calc_fr(double Temperature, double Pressure, double RelativeHumidity)
	{
		double VPw = 4e-6 * Math.pow(Temperature, 3) - 0.0004 * Math.pow(Temperature, 2) + 0.0234 * Temperature - 0.2517;
		double FRH = 0.995 * (Pressure / (Pressure - (0.3783) * RelativeHumidity * VPw));

		debug("Standardized Refraction: %f", FRH);
		return (FRH);
	}


	/**
	 * Pressure
	 *
	 * @param Pressure
	 *
	 * @return Standardized pressure
	 */
	private static inline double calc_fp(double Pressure)
	{
		double FP = (Pressure - STANDARD_PRESSURE) / STANDARD_PRESSURE;

		debug("Standardized Pressure: %f", FP);

		return (FP);
	}


	/**
	 * Temperature
	 *
	 * @param Temp
	 * @param Altitude
	 *
	 * @return Standardized temperature
	 */
	private static double calc_ft(double Temp, double Altitude)
	{
		// We're calculating the standard temperature at your
		// altitude using the lapse rate
		// http://en.wikipedia.org/wiki/Lapse_rate
		double Tstd = -0.0036 * Altitude + STANDARD_TEMP;

		// Funny math where you divide by "standard temp" above
		// converted to Rankine
		double FT = (Temp - Tstd) / Temperature.FahrenheitToRankine(Tstd);

		debug("Standardized Temperature: %f", FT);
		return (FT);
	}


	/**
	 * Altitude
	 *
	 * @param Altitude
	 *
	 * @return Standardized altitude
	 */
	private static double calc_fa(double Altitude)
	{
		double fa = -4e-15 * Math.pow(Altitude, 3) + 4e-10 * Math.pow(Altitude, 2) - 3e-5 * Altitude + 1;

		debug("Standardized altitude: %f", (1 / fa));
		return (1 / fa);
	}


	/**
	 * A function to correct a "standard" Drag Coefficient for differing atmospheric conditions.
	 * Returns the corrected drag coefficient for supplied drag coefficient and atmospheric conditions.
	 *
	 * @param DragCoefficient The coefficient of drag for a given projectile.
	 * @param Altitude The altitude above sea level in feet.  Standard altitude is 0 feet above sea level.
	 * @param Barometer The barometric pressure in inches of mercury (in Hg). This is not "absolute" pressure, it is the
	 *                  "standardized" pressure reported in the papers and news. Standard pressure is 29.53 in Hg.
	 * @param Temperature The temperature in Fahrenheit.  Standard temperature is 59 degrees.
	 * @param RelativeHumidity The relative humidity fraction.  Ranges from 0.00 to 1.00, with 0.50 being 50% relative humidity.
	 *                         Standard humidity is 78%
	 *
	 * @return The function returns a ballistic coefficient, corrected for the supplied atmospheric conditions.
	 */
	public static double atm_correct(double DragCoefficient, double Altitude, double Barometer, double Temperature, double RelativeHumidity)
	{
		double FA = calc_fa(Altitude);
		double FT = calc_ft(Temperature, Altitude);
		double FR = calc_fr(Temperature, Barometer, RelativeHumidity);
		double FP = calc_fp(Barometer);

		// Calculate the atmospheric correction factor
		double CD = (FA * (1 + FT - FP) * FR);

		debug("Calculated Atmospheric Correction Factor: %f", CD);
		debug("Atmospheric Correction Factor * Drag: %f", DragCoefficient * CD);

		return (DragCoefficient * CD);
	}
}
} // namespace
