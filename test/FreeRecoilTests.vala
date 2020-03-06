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

public class FreeRecoilTests : AbstractTestCase {
	public FreeRecoilTests()
	{
		base("FreeRecoil");
		add_test("FreeRecoil Calculate free recoil", test_calc_freerecoil);
	}


	public virtual void test_calc_freerecoil()
	{
		double val = LibBalistica.FreeRecoil.CalcFreeRecoil(589.9, 1275, 33.4, LibBalistica.PropellentGasVelocity.sal, 7);

		assert(val == 25.643819337020314);
	}
}
