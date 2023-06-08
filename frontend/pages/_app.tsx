import "../styles/globals.css";
import type { AppProps } from "next/app";
import { QueryClient, QueryClientProvider } from "react-query";
import { Provider } from "react-redux";
import { extendTheme } from "@chakra-ui/react";
import { ChakraProvider } from "@chakra-ui/react";
import Head from "next/head";
import { RecoilRoot } from "recoil";
import dynamic from "next/dynamic";
//import { WindowDimentionsProvider } from "../components/common/WindowDimentionsProvider";
//import store from "../hooks/store";

// window is not defined errorを避けるため
const WindowDimentionsProvider = dynamic(
  () => import("../components/common/WindowDimentionsProvider"),
  {
    ssr: false, // <- ここで ssr を無効にするオプションを渡す
  }
);

const colors = {
  jael: "FB8C6A",
};

const theme = extendTheme({ colors });

function MyApp({ Component, pageProps }: AppProps) {
  const queryClient = new QueryClient();

  return (
    <ChakraProvider theme={theme}>
      <RecoilRoot>
        <QueryClientProvider client={queryClient}>
          {/*<Provider store={store}>*/}
          <Head>
            <title>Circles</title>
            <meta
              name="description"
              content="There are contents for Japanese language learners to study efficiently, please check out!"
            />
            <link rel="shortcut icon" href="/JAEL_LOGO.png" />
            <link
              rel="apple-touch-icon"
              sizes="180x180"
              href="/JAEL_LOGO.png"
            />
            <link
              rel="icon"
              type="image/png"
              sizes="32x32"
              href="/JAEL_LOGO.png"
            />
            <link
              rel="icon"
              type="image/png"
              sizes="16x16"
              href="/JAEL_LOGO.png"
            />
            <link rel="mask-icon" href="/JAEL_LOGO.png" color="#5bbad5" />
          </Head>
          <WindowDimentionsProvider>
            <Component {...pageProps} />
          </WindowDimentionsProvider>
          {/*</Provider>*/}
        </QueryClientProvider>
      </RecoilRoot>
    </ChakraProvider>
  );
}

export default MyApp;
