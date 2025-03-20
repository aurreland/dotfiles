fn strip_hex(hex_string) {
    return hex_string[1..];
}

fn color_hex_to_c(hex) {
    if !hex.starts_with("#") || (hex.len() != 7) {
        return "0xffffffff";
    }

    let r = hex[1..3];
    let g = hex[3..5];
    let b = hex[5..7];
    let a = if hex.len() == 9 { hex[7..9] } else { "ff" };

    return `0x${r}${g}${b}${a}`;
}

fn color_hex_to_rgb_hypr(hex) {
    if !hex.starts_with("#") || (hex.len() != 7) {
        return "rgb(000000)";
    }

    return `rgb(${hex[1..3]}${hex[3..5]}${hex[5..7]})`
}

fn color_hex_to_rgba_str(hex)  {
    if !hex.starts_with("#") || (hex.len() != 7 && hex.len() != 9) {
        return "rgba(0, 0, 0, 1)";
    }

    let r = parse_int(hex[1..3], 16);
    let g = parse_int(hex[3..5], 16);
    let b = parse_int(hex[5..7], 16);
    let a = if hex.len() == 9 { parse_int(hex[7..9], 16) / 255.0 } else { 1.0 };

    return `rgba(${r}, ${g}, ${b}, ${a})`;
}
