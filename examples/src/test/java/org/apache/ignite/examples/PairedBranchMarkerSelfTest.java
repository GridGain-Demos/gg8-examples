/*
 * Copyright 2026 GridGain Systems, Inc. and Contributors.
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

package org.apache.ignite.examples;

import org.junit.Assert;
import org.junit.Test;

/**
 * Raises the suite's test count by one so a CI run shows whether it built this branch's examples or
 * the line branch's. Starts no node, so it cannot flake.
 */
public class PairedBranchMarkerSelfTest {
    /** */
    @Test
    public void testMarkerPresent() {
        Assert.assertTrue(true);
    }
}
