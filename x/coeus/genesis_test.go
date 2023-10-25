package coeus_test

import (
	"testing"

	keepertest "github.com/civet148/coeus-node/testutil/keeper"
	"github.com/civet148/coeus-node/testutil/nullify"
	"github.com/civet148/coeus-node/x/coeus"
	"github.com/civet148/coeus-node/x/coeus/types"
	"github.com/stretchr/testify/require"
)

func TestGenesis(t *testing.T) {
	genesisState := types.GenesisState{
		Params: types.DefaultParams(),

		// this line is used by starport scaffolding # genesis/test/state
	}

	k, ctx := keepertest.CoeusKeeper(t)
	coeus.InitGenesis(ctx, *k, genesisState)
	got := coeus.ExportGenesis(ctx, *k)
	require.NotNil(t, got)

	nullify.Fill(&genesisState)
	nullify.Fill(got)

	// this line is used by starport scaffolding # genesis/test/assert
}
