using System.Security.Claims;
using HotChocolate.AspNetCore;
using HotChocolate.Execution;

public sealed class BenchmarkHttpRequestInterceptor : IHttpRequestInterceptor
{
    /// <inheritdoc cref="IHttpRequestInterceptor.OnCreateAsync"/>
    public ValueTask OnCreateAsync(
        HttpContext context,
        IRequestExecutor requestExecutor,
        OperationRequestBuilder requestBuilder,
        CancellationToken cancellationToken)
    {
        if (context.Request.Headers.ContainsKey("benchmark-delay"))
        {
            return OnCreateWaitAsync(context, requestBuilder);
        }

        return OnCreateNoWaitAsync(context, requestBuilder);
    }

    private ValueTask OnCreateNoWaitAsync(
        HttpContext context,
        OperationRequestBuilder requestBuilder)
    {
        var userState = new UserState(context.User);

        requestBuilder.Features.Set(userState);
        requestBuilder.Features.Set(context);
        requestBuilder.Features.Set(context.User);

        requestBuilder.TrySetServices(context.RequestServices);
        requestBuilder.TryAddGlobalState(nameof(HttpContext), context);
        requestBuilder.TryAddGlobalState(nameof(ClaimsPrincipal), userState.User);

        return default;
    }

    private async ValueTask OnCreateWaitAsync(
        HttpContext context,
        OperationRequestBuilder requestBuilder)
    {
        var userState = new UserState(context.User);

        requestBuilder.Features.Set(userState);
        requestBuilder.Features.Set(context);
        requestBuilder.Features.Set(context.User);

        requestBuilder.TrySetServices(context.RequestServices);
        requestBuilder.TryAddGlobalState(nameof(HttpContext), context);
        requestBuilder.TryAddGlobalState(nameof(ClaimsPrincipal), userState.User);

        // this will simulate IO latency, it will introduce jitter but this also makes it more realistic
        await Task.Delay(4);
    }
}