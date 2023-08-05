fn main() {
  let answer = what_a_name(322,156);
  println!("top: 322 and left: 156 equal to {}", answer);
  assert_eq!(what_a_name(322,156), 306.48749781747574);
  assert_eq!(what_a_name(3,3), 0.875);
  assert_eq!(what_a_name(0,0), 0.0)
}

fn what_a_name (top: usize, left: usize) -> f64 {
  let mut counter = top;
  let mut pyramid: Vec<Vec<f64>> = vec![vec![1.0]];
  if top == 0 { return 0.};
  while counter > 0 {
    if let Some(row) = pyramid.get(&pyramid.len() - 1) {
      let mut row_with_zeros: Vec<f64> = row.to_vec();
      row_with_zeros.insert(0,0.0);
      row_with_zeros.push(0.0);

      let mut next_row = Vec::new();

      for brick in row_with_zeros.windows(2) {
        next_row.push(1. + (brick[0] + brick[1])/2.);
      }

      pyramid.push(next_row);
  }

  counter -= 1
  }
  pyramid.as_slice()[top][left] - 1.

}
