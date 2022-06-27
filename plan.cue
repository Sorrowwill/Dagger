package test_deploy

import (
    "dagger.io/dagger"
    "universe.dagger.io/bash"
    "universe.dagger.io/docker"
)

dagger.#Plan & {
    client: env: {
        package_name: string
    }

    actions: {
        Package: {
            Deps: docker.#Pull & {
                source: "ubuntu:20.04"
            }

            Build: bash.#Run & {
                input: Deps.output

                always: true
                script:
                    contents: "sleep 20"
            }
        }

        E2E: {
            CreateVM: bash.#Run & {
                always: true

                script:
                    contents: "sleep 20"
            }
        }
    }
}
