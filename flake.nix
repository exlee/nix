{
  description = "My (exlee) personal templates";

  outputs = { self }: {
    templates = {
      souffle-with-rust = {
        path = ./souffle-with-rust;
        description = "Soufflé with Rust Functors";
      };
    };
  };
}
