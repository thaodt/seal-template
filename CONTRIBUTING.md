# Contributing to {{project-name}}

This document will outline the basics of where to start if you wish to contribute to the project. We look forward to **your contribution**!
**Please read this document until the end**.

## Merge Requests Guideline

Here a few things you need to know before you start contributing to the project:

1. MRs should be made against the `main` branch.
2. Only merge when approved, DO NOT assign yourself - pair review is required.
3. After fixing the review, you can click this button to notify the reviewer, basically re-request the review:
![re-request reviews](/assets/re-request-review.jpg)
4. Below is how to self-resolve threads of CodeRabbitAI bot:
![resolve coderabbitai comments](/assets/auto-resolve-botai.jpg)
5. DO NOT resolve the reviewer's comment threads yourself. They will resolve their own threads because that is their own checklist.
![donot-resolve-reviewer-comment-yourself](/assets/donot-resolve-reviewer-comment-yourself.jpg)
In this screenshot, Tom was the reviewer, so only he has *the right to resolve* his comment's threads.
6. MRs must pass ALL the Gitlab CI pipeline checks and should have full test coverage. Typically, you'll need to be aware of these:

- Linter (clippy)
- Rust Formatter (cargo fmt)
- Unit Tests (cargo test)
- Conventional Commits

Please check out `.gitlab-ci.yml` and read below for more details.

## Tests

TBD. Feel free to adjust to fit your project.

## Code formatting

```bash
cargo fmt --all
```

## Linter

We try to solve all linter errors and warnings if possible. If you get a linter error that you can't fix, please add a comment and tag project maintainers to discuss further.

```bash
cargo clippy --all-targets --all-features -- -D warnings
```

OR if you just want to check it on your platform and default features only:

```bash
cargo clippy 
```

## Commit format

We use [Conventional Commits](https://www.conventionalcommits.org) for commit messages.

- [Convco](https://convco.github.io/check/)  
  To check your commits according to the format it can be [installed locally](https://convco.github.io/#installation)

    In short, a commit message should follow this format:

    ```bash
    <type>[optional scope]: <description>`

    [optional body]

    [optional footer(s)]
    ```

    For instance: `feat(key manager): add format check`

- For the full specification please take a look at <https://www.conventionalcommits.org>
- Reasons to use this format can be found in [this post](https://marcodenisi.dev/en/blog/why-you-should-use-conventional-commits).

### Most used types

- `fix`
- `feat`

### Further recommended types

- `build`
- `chore`
- `ci`
- `docs`
- `style`
- `refactor`
- `perf`
- `test`

## Code coverage report

TBD.

## Gitlab CI

The CI pipeline is defined in `.gitlab-ci.yml`.
