/* Copyright 2016-2020 Steven Oliver <oliver.steven@gmail.com>
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

public class LibBalisticaTests : AbstractTestCase {
   public LibBalisticaTests () {
	  base ("LibBalistica") ;
	  add_test ("Computational unit", test_computation_unit) ;
	  add_test ("Gravity", test_gravity) ;
	  add_test ("Standard pressure", test_standard_pressure) ;
	  add_test ("Standard tempurature", test_standard_tempurature) ;
	  add_test ("Retard", test_retard_calcretard) ;
	  add_test ("Windage CalcWindage", test_windage_calc) ;
	  add_test ("Windage HeadWindage", test_windage_head) ;
	  add_test ("Windage CrossWindage", test_windage_cross) ;
	  add_test ("Zero", test_zero_calculation) ;
	  // TODO add_test ("PBR", test_pbr) ;
	  // TODO add_test ("Atmosphere", test_atmosphere) ;
	  // TODO add_test ("Solve", test_solve) ;
	  // TODO add_test ("Solution", test_solution) ;
   }

   public virtual void test_gravity() {
	  assert (LibBalistica.GRAVITY == -32.1609) ;
   }

   public virtual void test_standard_pressure() {
	  assert (LibBalistica.STANDARD_PRESSURE == 29.92) ;
   }

   public virtual void test_standard_tempurature() {
	  assert (LibBalistica.STANDARD_TEMP == 59.0) ;
   }

   public virtual void test_computation_unit() {
	  LibBalistica.CompUnit unit = LibBalistica.CompUnit () {
		 range = 5.1,
		 drop = 5.2,
		 correction = 5.3,
		 time = 5.4,
		 windage_in = 5.5,
		 windage_moa = 5.6,
		 velocity_com = 5.7,
		 horizontal_velocity = 5.8,
		 vertical_velocity = 5.9
	  } ;

	  assert (unit.range == 5.1) ;
	  assert (unit.drop == 5.2) ;
	  assert (unit.correction == 5.3) ;
	  assert (unit.time == 5.4) ;
	  assert (unit.windage_in == 5.5) ;
	  assert (unit.windage_moa == 5.6) ;
	  assert (unit.velocity_com == 5.7) ;
	  assert (unit.horizontal_velocity == 5.8) ;
	  assert (unit.vertical_velocity == 5.9) ;
   }

   public virtual void test_zero_calculation() {
	  double G1 = LibBalistica.Zero.ZeroAngle (LibBalistica.DragFunction.G1, 0.465, 2650, 1.6, 200, 0) ;
	  double G2 = LibBalistica.Zero.ZeroAngle (LibBalistica.DragFunction.G2, 0.465, 2650, 1.6, 200, 0) ;
	  double G5 = LibBalistica.Zero.ZeroAngle (LibBalistica.DragFunction.G5, 0.465, 2650, 1.6, 200, 0) ;
	  double G6 = LibBalistica.Zero.ZeroAngle (LibBalistica.DragFunction.G6, 0.465, 2650, 1.6, 200, 0) ;
	  double G7 = LibBalistica.Zero.ZeroAngle (LibBalistica.DragFunction.G7, 0.465, 2650, 1.6, 200, 0) ;
	  double G8 = LibBalistica.Zero.ZeroAngle (LibBalistica.DragFunction.G8, 0.465, 2650, 1.6, 200, 0) ;
	  double I = LibBalistica.Zero.ZeroAngle (LibBalistica.DragFunction.I, 0.465, 2650, 1.6, 200, 0) ;
	  double B = LibBalistica.Zero.ZeroAngle (LibBalistica.DragFunction.B, 0.465, 2650, 1.6, 200, 0) ;

	  assert (G1 == 0.0998687744140625) ;
	  assert (G2 == 0.095596313476562514) ;
	  assert (G5 == 0.0968780517578125) ;
	  assert (G6 == 0.0960235595703125) ;
	  assert (G7 == 0.095596313476562514) ;
	  assert (G8 == 0.0958099365234375) ;
	  assert (I == 0.10029602050781251) ;
	  assert (B == 0.1000823974609375) ;
   }

   public virtual void test_retard_calcretard() {
	  double G1 = LibBalistica.Retard.CalcRetard (LibBalistica.DragFunction.G1, 0.465, 2650) ;
	  double G2 = LibBalistica.Retard.CalcRetard (LibBalistica.DragFunction.G2, 0.465, 2650) ;
	  double G5 = LibBalistica.Retard.CalcRetard (LibBalistica.DragFunction.G5, 0.465, 2650) ;
	  double G6 = LibBalistica.Retard.CalcRetard (LibBalistica.DragFunction.G6, 0.465, 2650) ;
	  double G7 = LibBalistica.Retard.CalcRetard (LibBalistica.DragFunction.G7, 0.465, 2650) ;
	  double G8 = LibBalistica.Retard.CalcRetard (LibBalistica.DragFunction.G8, 0.465, 2650) ;
	  double I = LibBalistica.Retard.CalcRetard (LibBalistica.DragFunction.I, 0.465, 2650) ;
	  double B = LibBalistica.Retard.CalcRetard (LibBalistica.DragFunction.B, 0.465, 2650) ;

	  assert (G1 == 1700.6101549599655) ;
	  assert (G2 == 836.74681264648268) ;
	  assert (G5 == 1091.469144250384) ;
	  assert (G6 == 949.69767441680813) ;
	  assert (G7 == 846.55271847810116) ;
	  assert (G8 == 912.72086631572529) ;
	  assert (I == 1768.585858301544) ;
	  assert (B == 1721.5850610419966) ;
   }

   public virtual void test_windage_calc() {
	  double val = LibBalistica.Windage.CalcWindage (2.0, 1200, 100, 3) ;
	  assert (val == 102.66666666666667) ;
   }

   public virtual void test_windage_head() {
	  double val = LibBalistica.Windage.HeadWind (2.0, 0) ;
	  assert (val == 2) ;
   }

   public virtual void test_windage_cross() {
	  double val = LibBalistica.Windage.CrossWind (2.0, 0) ;
	  assert (val == 0) ;
   }

}
