/* Copyright (C) 2009 Julien Peeters
 * Copyright (C) 2016-2020 Steven Oliver
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */
void main(string[] args)
{
	Test.init(ref args);

	TestSuite.get_root().add_suite(new ConversionTests().get_suite());
	TestSuite.get_root().add_suite(new GreenhillTests().get_suite());
	TestSuite.get_root().add_suite(new LibBalisticaTests().get_suite());
	TestSuite.get_root().add_suite(new MillerTests().get_suite());

	Test.run();
}
