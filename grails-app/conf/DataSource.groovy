/**
 * Copyright (C) 2013 Cyril Brouillard <cyril.brouillard@gmail.com>
 *
 * This file is part of reportmaker.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
def ENV_NAME = "REPORTMAKER_CONF"
def props = new Properties()
if (System.getenv(ENV_NAME)) {
    InputStream is = new BufferedInputStream(new FileInputStream(System.getenv(ENV_NAME)))
    props.load(is)
    is.close()
}

dataSource {
    pooled = true
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            driverClassName = props.get("datasource.driverClassName")
            username = props.get("datasource.username")
            password = props.get("datasource.password")
            dbCreate = props.get("datasource.dbCreate")
            url = props.get("datasource.url")
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            driverClassName = props.get("datasource.driverClassName")
            username = props.get("datasource.username")
            password = props.get("datasource.password")
            dbCreate = props.get("datasource.dbCreate")
            url = props.get("datasource.url")
        }
    }
}
