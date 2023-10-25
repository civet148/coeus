package keeper_test

import (
	"testing"

	testkeeper "github.com/civet148/coeus-node/testutil/keeper"
	"github.com/civet148/coeus-node/x/coeus/types"
	"github.com/stretchr/testify/require"
)

func TestGetParams(t *testing.T) {
	k, ctx := testkeeper.CoeusKeeper(t)
	params := types.DefaultParams()

	k.SetParams(ctx, params)

	require.EqualValues(t, params, k.GetParams(ctx))
}
