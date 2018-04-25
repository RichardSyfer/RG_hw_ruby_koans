# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  raise TriangleError, 'Sides lengths should be greater than 0' if a<=0 or b<=0 or c<=0

  sidesArr = [a,b,c]
  longestSide = sidesArr.max
  perimeter = 0
  sidesArr.each { |side| perimeter += side }
  if perimeter - longestSide <= longestSide
    raise TriangleError, "It isn't triangle. Two sides longer than longest one"
  end

  if a==b and a==c
    :equilateral
  elsif a!=b and b!=c and a!=c
    :scalene
  else
    :isosceles
  end

end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
