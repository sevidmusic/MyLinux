use std::env;
use std::fs::File;
use std::io;
use std::path::Path;
use std::io::Read;
use std::io::Write;


use colored::*;

fn main() -> io::Result<()> {
    let mut todos = read_todos()?;

    let mut args = env::args();
    let command = args.nth(1).unwrap_or_else(|| "".to_string());

    match command.as_str() {
        "add" => {
            let new_todo = args.collect::<Vec<_>>().join(" ");
            todos.push(new_todo);
            write_todos(&todos)?;
        }
        "list" => {
            for (i, todo) in todos.iter().enumerate() {
                println!("{}: {}", i + 1, todo.green());
            }
        }
        "done" => {
            let index: usize = args.next().unwrap().parse().unwrap();
            todos.remove(index - 1);
            write_todos(&todos)?;
        }
        _ => println!("Invalid command"),
    }

    Ok(())
}

fn read_todos() -> io::Result<Vec<String>> {
    let path = Path::new(".todos");
    if path.exists() {
        let mut file = File::open(path)?;
        let mut contents = String::new();
        file.read_to_string(&mut contents)?;
        Ok(contents.lines().map(|s| s.to_string()).collect())
    } else {
        Ok(Vec::new())
    }
}

fn write_todos(todos: &[String]) -> io::Result<()> {
    let mut file = File::create(".todos")?;
    for todo in todos {
        writeln!(file, "{}", todo)?;
    }
    Ok(())
}

