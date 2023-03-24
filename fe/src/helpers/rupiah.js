const convert = (params) => {
  let number_string = params
      .toString()
      .replace(/[^,\d]/g, "")
      .toString(),
    split = number_string.split(","),
    sisa = split[0].length % 3,
    euro = split[0].substr(0, sisa),
    thousand = split[0].substr(sisa).match(/\d{3}/gi);

  if (thousand) {
    let separator = sisa ? "." : "";
    euro += separator + thousand.join(".");
  }

  euro = split[1] !== undefined ? euro + "," + split[1] : euro;
  return `EUR ${euro}`;
};

export default convert;
