final: prev: {
  hello = prev.hello.overrideAttrs (old: {
    meta = old.meta // { description = "Hello, but with a custom overlay!"; };
  });
}