# GOVUK Mockup Kit

I had this idea to make a "website builder" style interface (like Squarespace /
Wix) backed by the [GOVUK Design
System](https://design-system.service.gov.uk/get-started/). So you'd be able to
drag and drop components, create new pages, and by the end of it have something
that looks like a prototype of a service. Maybe a button at the end to export
it / "eject" it as a self-contained
[govuk-prototype-kit](https://govuk-prototype-kit.herokuapp.com/docs) or
[govuk-prototype-rig](https://github.com/x-govuk/govuk-prototype-rig) project.

If you're reading this, I never got around to finishing up this idea, but like
most things I work on and never finish I pushed it up to GitHub anyway. If it
sounds cool to you too feel free to reach out and chat to me about it.

## Setup

```sh
asdf install # Install relevant ruby versions/tooling, see .tool-versions
pg_ctl start # If not already running postgres
bin/setup

bin/dev
bin/test
bin/lint
```

## Licence

[GPLv3](LICENSE).
