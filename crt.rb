def e_gcd a, b
  l_r, r = a.abs, b.abs
  x, l_x, y, l_y = 0, 1, 1, 0
  while r != 0
    l_r, (q, r) = r, l_r.divmod(r)
    x, l_x = l_x - q*x, x
    y, l_y = l_y - q*y, y
  end
  return l_r, l_x * (a < 0 ? -1 : 1)
end

def invmod e, et
  g, x = e_gcd e, et
  x % et
end

def c_r m, rs
  max = m.inject(&:*)   # product of all moduli
  s = rs.zip(m).map{ |r,m| (r * max * invmod(max/m, m) / m) }
  s.inject(&:+) % max
end
