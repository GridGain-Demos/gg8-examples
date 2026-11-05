/*
 * Copyright 2019 GridGain Systems, Inc. and Contributors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.ignite.examples.ml.util;

import java.util.Arrays;

/**
 * Some common arguments for examples in ML module.
 */
public class MLExamplesCommonArgs {
    /**
     * Unattended argument.
     */
    public static final String UNATTENDED = "unattended";

    /** Empty args for ML examples. */
    public static final String[] EMPTY_ARGS_ML = new String[] {"--" + UNATTENDED};

    /**
     * @param args Example arguments.
     * @return {@code true} if the example runs unattended, as in the test suite.
     */
    public static boolean isUnattended(String[] args) {
        return args != null && Arrays.asList(args).contains("--" + UNATTENDED);
    }
}
