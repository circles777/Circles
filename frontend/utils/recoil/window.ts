import { atom, useRecoilValue, useSetRecoilState } from "recoil";
import { useCallback } from "react";

export type WindowState = {
  width: number;
  height: number;
};

export type UseWindowMutatorsProps = {
  setWindowWidth: (num: number) => void;
  setWindowHeight: (num: number) => void;
};

export const windowState = atom<WindowState>({
  key: "window",
  default: {
    width: 0,
    height: 0,
  },
});

export const useWindowState = (): WindowState => {
  return useRecoilValue(windowState);
};

export const useWindowMutators = (): UseWindowMutatorsProps => {
  const setState = useSetRecoilState(windowState);
  const setWindowWidth = useCallback(
    (width: number) => {
      setState((prev) => ({ ...prev, width }));
    },
    [setState]
  );
  const setWindowHeight = useCallback(
    (height: number) => {
      setState((prev) => ({ ...prev, height }));
    },
    [setState]
  );

  return {
    setWindowWidth,
    setWindowHeight,
  };
};
