FROM openfrontier/gerrit

ADD gerrit_config/ /gerrit_config

ADD gerrit_config/init/*.sh /docker-entrypoint-init.d/
RUN chmod u+x /docker-entrypoint-init.d/*.sh

RUN wget \
    ${GERRITFORGE_URL}/job/plugin-avatars-gravatar-${PLUGIN_VERSION}/${GERRITFORGE_ARTIFACT_DIR}/avatars-gravatar/avatars-gravatar.jar \
    -P /gerrit_config/plugins

RUN wget \
    ${GERRITFORGE_URL}/job/plugin-reviewers-${PLUGIN_VERSION}/${GERRITFORGE_ARTIFACT_DIR}/reviewers/reviewers.jar \
    -P /gerrit_config/plugins
