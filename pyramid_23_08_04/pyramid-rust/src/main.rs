fn main() {
  let answer = what_a_name(322,156);
  println!("top: 322 and left: 156 equal to {}", answer);
  assert_eq!(what_a_name(322,156), 306.48749781747574);
  assert_eq!(what_a_name(3,3), 0.875);
  assert_eq!(what_a_name(0,0), 0.0)
}

fn what_a_name (top: usize, left: usize) -> f64 {
  let mut counter = top;
  let mut pyramid: Vec<Vec<f64>> = vec![vec![0., 1., 0.]];
  if top == 0 { return 0.};
  while counter > 0 {
    if let Some(row) = pyramid.get(&pyramid.len() - 1) {
      let current_row = row;

      let mut next_row = vec![0.];
      let length = current_row.len();

      for ix in 0..length {
        if let Some(_) = current_row.get(ix+1) {
          next_row.push(1. + (current_row[ix] + current_row[ix+1])/2.)
        }
        }
      next_row.push(0.);
      pyramid.push(next_row);
  }

  counter -= 1
  }

  pyramid.as_slice()[top][left+1] - 1.

}
