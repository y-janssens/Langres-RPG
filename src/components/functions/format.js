export function formatGames(items) {
  if (!items) {
    return [];
  }
  let saved_games = [];
  const games = JSON.parse(
    items.replace("Ok(", "").replace("])", "]").replace('}")', '}"')
  );
  if (Array.isArray(games)) {
    games.forEach((fn) => {
      saved_games.push(JSON.parse(fn));
    });
    return saved_games;
  }
  return JSON.parse(games);
}
