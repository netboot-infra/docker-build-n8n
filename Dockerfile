FROM docker.n8n.io/n8nio/n8n:1.121.2

USER root

RUN sed -i.bak -E 's#this\.manager\?\.[[:space:]]*hasFeatureEnabled\(feature\)[[:space:]]*\?\?[[:space:]]*false#true#g' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak '/getConsumerId()/,/}/ s#return.*;#        return '\''123-;D'\'';#' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak '/getUsersLimit()/,/}/    s#return.*;#        return constants_1.UNLIMITED_LICENSE_QUOTA;#' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak '/getTriggerLimit()/,/}/   s#return.*;#        return constants_1.UNLIMITED_LICENSE_QUOTA;#' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak '/getVariablesLimit()/,/}/ s#return.*;#        return constants_1.UNLIMITED_LICENSE_QUOTA;#' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak '/getAiCredits()/,/}/       s#return.*;#        return 999;#' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak '/getWorkflowHistoryPruneLimit()/,/}/ s#return.*;#        return constants_1.UNLIMITED_LICENSE_QUOTA;#' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak '/getInsightsMaxHistory()/,/}/        s#return.*;#        return 180;#' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak '/isAPIDisabled()/,/}/        s#return.*;#        return false;#' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak '/getInsightsRetentionMaxAge()/,/}/   s#return.*;#        return 1800;#' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak '/getInsightsRetentionPruneInterval()/,/}/ s#return.*;#        return 2400;#' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak '/getTeamProjectLimit()/,/}/      s#return.*;#        return 200;#' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak -E "s#this\.getValue\('planName'\)[[:space:]]*\?\?[[:space:]]*'Community';#'Enterprise';#g" /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak 's#await this\.manager\.activate(activationKey);#//await this.manager.activate(activationKey);#g' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak 's#await this\.manager\.reload();#//await this.manager.reload();#g' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak 's#await this\.manager\.clear();#//await this.manager.clear();#g' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak 's#await this\.manager\.renew();#//await this.manager.renew();#g' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak 's#await this\.manager\.shutdown();#//await this.manager.shutdown();#g' /usr/local/lib/node_modules/n8n/dist/license.js
RUN sed -i.bak 's#showNonProdBanner: this\.license\.isLicensed(constants_1\.LICENSE_FEATURES\.SHOW_NON_PROD_BANNER),#showNonProdBanner: false,#g' /usr/local/lib/node_modules/n8n/dist/services/frontend.service.js
RUN sed -i.bak "s#const limit =.*#const limit = 999;#" /usr/local/lib/node_modules/n8n/dist/services/project.service.ee.js

USER node